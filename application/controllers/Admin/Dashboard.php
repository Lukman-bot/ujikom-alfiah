<?php

class Dashboard extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        cek_login();
    }
    public function Index()
    {
        $data=[
            'title'     => 'Hotel-Ku | Dashboard',
            'judul'     => 'Dashboard',
            'subjudul'  => 'Dashboard',
            'breadcrum1'    => 'Dashboard'
        ];
        $this->template->load('Admin/Template','Admin/Dashboard/Index',$data);
    }
}