require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { ccosto: @project.ccosto, ciudad: @project.ciudad, comuna: @project.comuna, descripcion: @project.descripcion, fecha_inicio: @project.fecha_inicio, fecha_termino: @project.fecha_termino, gastosgenerales: @project.gastosgenerales, impuesto_iva: @project.impuesto_iva, name: @project.name, plazoej: @project.plazoej, region: @project.region, tcostodirecto: @project.tcostodirecto, tneto: @project.tneto, toferta: @project.toferta, utilidades: @project.utilidades } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { ccosto: @project.ccosto, ciudad: @project.ciudad, comuna: @project.comuna, descripcion: @project.descripcion, fecha_inicio: @project.fecha_inicio, fecha_termino: @project.fecha_termino, gastosgenerales: @project.gastosgenerales, impuesto_iva: @project.impuesto_iva, name: @project.name, plazoej: @project.plazoej, region: @project.region, tcostodirecto: @project.tcostodirecto, tneto: @project.tneto, toferta: @project.toferta, utilidades: @project.utilidades } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
