From: Laurence Darby <ldarby@tuffmail.com>
Subject: Re: Core 2 Duo E8400 stepping 6 not recognised
Date: Fri, 18 Jul 2008 13:50:03 +0100
Message-ID: <20080718135003.434a3350.ldarby@tuffmail.com>
References: <20080717001145.122c97b7.ldarby@tuffmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080717001145.122c97b7.ldarby@tuffmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk



I turned on full ACPI debug, with the _PPC patch, and got this:

[  170.220293] acpi-cpufreq: acpi_cpufreq_init
[  170.220293] acpi-cpufreq: acpi_cpufreq_early_init
[  170.220293] nsxfeval-0175 [01] evaluate_object       : ----Entry
[  170.220293]   nseval-0082 [02] ns_evaluate           : ----Entry
[  170.220384]  nsutils-0833 [03] ns_get_node           : ----Entry c063a282
[  170.220474]  nsutils-0481 [04] ns_internalize_name   : ----Entry
[  170.220562]  nsutils-0370 [05] ns_build_internal_name: ----Entry
[  170.220649]  nsutils-0454 [05] ns_build_internal_name: Returning [f74e8b08] (rel) "_PSD"
[  170.220769]  nsutils-0457 [05] ns_build_internal_name: ----Exit- AE_OK
[  170.220858]  nsutils-0509 [04] ns_internalize_name   : ----Exit- AE_OK
[  170.220947] nsaccess-0306 [04] ns_lookup             : ----Entry
[  170.221035]  nsutils-0789 [05] ns_opens_scope        : ----Entry Processor
[  170.221125]  nsutils-0799 [05] ns_opens_scope        : ----Exit- 0000000000000001
[  170.221243] nsaccess-0406 [04] ns_lookup             : Searching relative to prefix scope [CPU0] (f7c100d8)
[  170.221366] nsaccess-0516 [04] ns_lookup             : Simple Pathname (1 segment, Flags=2)
[  170.221486]   nsdump-0087 [04] ns_print_pathname     : [_PSD]
[  170.221655] nssearch-0303 [05] ns_search_and_enter   : ----Entry
[  170.221744] nssearch-0097 [06] ns_search_one_scope   : ----Entry
[  170.221832]  nsnames-0135 [07] ns_get_external_pathna: ----Entry f7c100d8
[  170.221922]  nsnames-0152 [07] ns_get_external_pathna: ----Exit- f75247a0
[  170.222012] nssearch-0109 [06] ns_search_one_scope   : Searching \_PR_.CPU0 (f7c100d8) For [_PSD] (Untyped)
[  170.222134] nssearch-0173 [06] ns_search_one_scope   : Name [_PSD] (Untyped) not found in search in scope [CPU0]f7c100d8 first child 00000000
[  170.222263] nssearch-0175 [06] ns_search_one_scope   : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.222384] nssearch-0385 [05] ns_search_and_enter   : _PSD Not found in f7c100d8 [Not adding]
[  170.222505] nssearch-0387 [05] ns_search_and_enter   : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.222626] nsaccess-0577 [04] ns_lookup             : Name [_PSD] not found in scope [CPU0] f7c100d8
[  170.222747] nsaccess-0581 [04] ns_lookup             : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.222867]  nsutils-0869 [03] ns_get_node           : _PSD, AE_NOT_FOUND
[  170.222957]  nsutils-0876 [03] ns_get_node           : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.223078]   nseval-0102 [02] ns_evaluate           : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.223199] nsxfeval-0349 [01] evaluate_object       : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.223319] nsxfeval-0175 [01] evaluate_object       : ----Entry
[  170.223407]   nseval-0082 [02] ns_evaluate           : ----Entry
[  170.223495]  nsutils-0833 [03] ns_get_node           : ----Entry c063a282
[  170.223585]  nsutils-0481 [04] ns_internalize_name   : ----Entry
[  170.223673]  nsutils-0370 [05] ns_build_internal_name: ----Entry
[  170.223761]  nsutils-0454 [05] ns_build_internal_name: Returning [f74e8b08] (rel) "_PSD"
[  170.223880]  nsutils-0457 [05] ns_build_internal_name: ----Exit- AE_OK
[  170.223969]  nsutils-0509 [04] ns_internalize_name   : ----Exit- AE_OK
[  170.224059] nsaccess-0306 [04] ns_lookup             : ----Entry
[  170.224146]  nsutils-0789 [05] ns_opens_scope        : ----Entry Processor
[  170.224236]  nsutils-0799 [05] ns_opens_scope        : ----Exit- 0000000000000001
[  170.224355] nsaccess-0406 [04] ns_lookup             : Searching relative to prefix scope [CPU1] (f7c100f0)
[  170.224478] nsaccess-0516 [04] ns_lookup             : Simple Pathname (1 segment, Flags=2)
[  170.224598]   nsdump-0087 [04] ns_print_pathname     : [_PSD]
[  170.224767] nssearch-0303 [05] ns_search_and_enter   : ----Entry
[  170.224856] nssearch-0097 [06] ns_search_one_scope   : ----Entry
[  170.224943]  nsnames-0135 [07] ns_get_external_pathna: ----Entry f7c100f0
[  170.225033]  nsnames-0152 [07] ns_get_external_pathna: ----Exit- f75247a0
[  170.225123] nssearch-0109 [06] ns_search_one_scope   : Searching \_PR_.CPU1 (f7c100f0) For [_PSD] (Untyped)
[  170.225245] nssearch-0173 [06] ns_search_one_scope   : Name [_PSD] (Untyped) not found in search in scope [CPU1] f7c100f0 first child 00000000
[  170.225375] nssearch-0175 [06] ns_search_one_scope   : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.225496] nssearch-0385 [05] ns_search_and_enter   : _PSD Not found in f7c100f0 [Not adding]
[  170.225616] nssearch-0387 [05] ns_search_and_enter   : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.225737] nsaccess-0577 [04] ns_lookup             : Name [_PSD] not found in scope [CPU1] f7c100f0
[  170.225859] nsaccess-0581 [04] ns_lookup             : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.225979]  nsutils-0869 [03] ns_get_node           : _PSD, AE_NOT_FOUND
[  170.226068]  nsutils-0876 [03] ns_get_node           : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.226189]   nseval-0102 [02] ns_evaluate           : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.226310] nsxfeval-0349 [01] evaluate_object       : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.226431] cpufreq-core: trying to register driver acpi-cpufreq
[  170.226433] cpufreq-core: adding CPU 0
[  170.226434] acpi-cpufreq: acpi_cpufreq_cpu_init
[  170.226436] cpufreq-core: acpi_processor_register_performance
[  170.226437]  nsutils-0833 [01] ns_get_node           : ----Entry c0639f57
[  170.226526]  nsutils-0481 [02] ns_internalize_name   : ----Entry
[  170.226614]  nsutils-0370 [03] ns_build_internal_name: ----Entry
[  170.226703]  nsutils-0454 [03] ns_build_internal_name: Returning [f74e8b08] (rel) "_PCT"
[  170.226823]  nsutils-0457 [03] ns_build_internal_name: ----Exit- AE_OK
[  170.226911]  nsutils-0509 [02] ns_internalize_name   : ----Exit- AE_OK
[  170.227000] nsaccess-0306 [02] ns_lookup             : ----Entry
[  170.227088]  nsutils-0789 [03] ns_opens_scope        : ----Entry Processor
[  170.227178]  nsutils-0799 [03] ns_opens_scope        : ----Exit- 0000000000000001
[  170.227297] nsaccess-0406 [02] ns_lookup             : Searching relative to prefix scope [CPU0] (f7c100d8)
[  170.227420] nsaccess-0516 [02] ns_lookup             : Simple Pathname (1 segment, Flags=2)
[  170.227540]   nsdump-0087 [02] ns_print_pathname     : [_PCT]
[  170.227708] nssearch-0303 [03] ns_search_and_enter   : ----Entry
[  170.227796] nssearch-0097 [04] ns_search_one_scope   : ----Entry
[  170.227885]  nsnames-0135 [05] ns_get_external_pathna: ----Entry f7c100d8
[  170.227975]  nsnames-0152 [05] ns_get_external_pathna: ----Exit- f75247a0
[  170.228064] nssearch-0109 [04] ns_search_one_scope   : Searching \_PR_.CPU0 (f7c100d8) For [_PCT] (Untyped)
[  170.228187] nssearch-0173 [04] ns_search_one_scope   : Name [_PCT] (Untyped) not found in search in scope [CPU0] f7c100d8 first child 00000000
[  170.228348] nssearch-0175 [04] ns_search_one_scope   : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.228469] nssearch-0385 [03] ns_search_and_enter   : _PCT Not found in f7c100d8 [Not adding]
[  170.228589] nssearch-0387 [03] ns_search_and_enter   : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.228710] nsaccess-0577 [02] ns_lookup             : Name [_PCT] not found in scope [CPU0] f7c100d8
[  170.228831] nsaccess-0581 [02] ns_lookup             : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.228953]  nsutils-0869 [01] ns_get_node           : _PCT, AE_NOT_FOUND
[  170.229043]  nsutils-0876 [01] ns_get_node           : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.229165] processor_perflib-0349 [00] processor_get_performa: ACPI-based processor performance control unavailable
[  170.229291] cpufreq-core: initialization failed
[  170.229292] cpufreq-core: adding CPU 1
[  170.229294] acpi-cpufreq: acpi_cpufreq_cpu_init
[  170.229295] cpufreq-core: acpi_processor_register_performance
[  170.229296]  nsutils-0833 [01] ns_get_node           : ----Entry c0639f57
[  170.229386]  nsutils-0481 [02] ns_internalize_name   : ----Entry
[  170.229473]  nsutils-0370 [03] ns_build_internal_name: ----Entry
[  170.229561]  nsutils-0454 [03] ns_build_internal_name: Returning [f74e8b08] (rel) "_PCT"
[  170.229681]  nsutils-0457 [03] ns_build_internal_name: ----Exit- AE_OK
[  170.229770]  nsutils-0509 [02] ns_internalize_name   : ----Exit- AE_OK
[  170.229859] nsaccess-0306 [02] ns_lookup             : ----Entry
[  170.229946]  nsutils-0789 [03] ns_opens_scope        : ----Entry Processor
[  170.230036]  nsutils-0799 [03] ns_opens_scope        : ----Exit- 0000000000000001
[  170.230155] nsaccess-0406 [02] ns_lookup             : Searching relative to prefix scope [CPU1] (f7c100f0)
[  170.230278] nsaccess-0516 [02] ns_lookup             : Simple Pathname (1 segment, Flags=2)
[  170.230397]   nsdump-0087 [02] ns_print_pathname     : [_PCT]
[  170.230566] nssearch-0303 [03] ns_search_and_enter   : ----Entry
[  170.230654] nssearch-0097 [04] ns_search_one_scope   : ----Entry
[  170.230742]  nsnames-0135 [05] ns_get_external_pathna: ----Entry f7c100f0
[  170.230832]  nsnames-0152 [05] ns_get_external_pathna: ----Exit- f75247a0
[  170.230922] nssearch-0109 [04] ns_search_one_scope   : Searching \_PR_.CPU1 (f7c100f0) For [_PCT] (Untyped)
[  170.231046] nssearch-0173 [04] ns_search_one_scope   : Name [_PCT] (Untyped) not found in search in scope [CPU1] f7c100f0 first child 00000000
[  170.231721] nssearch-0175 [04] ns_search_one_scope   : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.231842] nssearch-0385 [03] ns_search_and_enter   : _PCT Not found in f7c100f0 [Not adding]
[  170.231963] nssearch-0387 [03] ns_search_and_enter   : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.232083] nsaccess-0577 [02] ns_lookup             : Name [_PCT] not found in scope [CPU1] f7c100f0
[  170.232204] nsaccess-0581 [02] ns_lookup             : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.232327]  nsutils-0869 [01] ns_get_node           : _PCT, AE_NOT_FOUND
[  170.232416]  nsutils-0876 [01] ns_get_node           : ----Exit- ****Exception****: AE_NOT_FOUND
[  170.232539] processor_perflib-0349 [00] processor_get_performa: ACPI-based processor performance control unavailable
[  170.232665] cpufreq-core: initialization failed
[  170.232666] cpufreq-core: no CPU initialized for driver acpi-cpufreq
[  170.232668] cpufreq-core: unregistering CPU 0
[  170.232669] cpufreq-core: unregistering CPU 1
