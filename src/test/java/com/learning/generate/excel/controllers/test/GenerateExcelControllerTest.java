package com.learning.generate.excel.controllers.test;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.learning.generate.excel.BuildUtil;
import com.learning.generate.excel.controllers.GenerateExcelController;
import com.learning.generate.excel.services.GenerateExcelUsingListService;
import com.learning.generate.excel.services.entities.ReportParameter;
import com.learning.generate.excel.services.entities.ReportResponse;

import ch.qos.logback.core.status.Status;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.IOException;
import java.text.ParseException;

@ExtendWith(SpringExtension.class)
@AutoConfigureMockMvc
@SpringBootTest(classes = GenerateExcelController.class)
public class GenerateExcelControllerTest {

	@Autowired
	private MockMvc mockMvc;
	@MockBean
	private GenerateExcelUsingListService generateExcelUsingListService;
	
	
	ReportParameter parameter = BuildUtil.getInstance().reportParameter();
	ReportResponse response = BuildUtil.getInstance().reportResponse();
	
	
	@Test
	@DisplayName("should return success generate report excel using list")
	public void generateExcelUsingList() throws Exception {
		when(generateExcelUsingListService.generateExcel(this.parameter)).thenReturn(this.response);
		RequestBuilder requestBuilder = MockMvcRequestBuilders.post("/api/generateExcelUsingList")
				.contentType(MediaType.APPLICATION_JSON)
				.content(asJsonString(this.response))
				.content(asJsonString(this.parameter));
		mockMvc.perform(requestBuilder).andExpect(status().isOk());
		MvcResult requestResult = mockMvc.perform(requestBuilder).andReturn();
		MockHttpServletResponse response = requestResult.getResponse();
		assertNotNull(response);
	}
	
	static String asJsonString(final Object object) {
		try {
			return new ObjectMapper().writeValueAsString(object);
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	
}
