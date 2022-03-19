*** Settings ***
Documentation       Este aqui é o nosso gerenciador de dependências.

Library             SeleniumLibrary
Library             DebugLibrary
Library             FakerLibrary        locale=pt_BR

Resource            ../auto/keywords/kws_search.robot
Resource            ../auto/keywords/kws_register.robot
Resource            ../auto/pages/page_home.robot
Resource            ../auto/pages/page_search.robot
Resource            ../auto/pages/page_register.robot
Resource            hooks.robot