From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9745] New: CPU is waking up too often
Date: Mon, 14 Jan 2008 04:43:40 -0800 (PST)
Message-ID: <bug-9745-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=9745

           Summary: CPU is waking up too often
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.24-rc7
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: schoenfeld@in-medias-res.com


Latest working kernel version: 2.6.22
Earliest failing kernel version: 2.6.24-rc7
Distribution: Debian GNU/Linux Sid (Unstable)
Hardware Environment:
CPU: Mobile AMD Sempron(tm) Processor 3300+
System is a Fujitsu Siemens K7610 mobile system.
lspci:
00:00.0 Host bridge: VIA Technologies, Inc. K8M800 Host Bridge
00:00.1 Host bridge: VIA Technologies, Inc. K8M800 Host Bridge
00:00.2 Host bridge: VIA Technologies, Inc. K8M800 Host Bridge
00:00.3 Host bridge: VIA Technologies, Inc. K8M800 Host Bridge
00:00.4 Host bridge: VIA Technologies, Inc. K8M800 Host Bridge
00:00.7 Host bridge: VIA Technologies, Inc. K8M800 Host Bridge
00:01.0 PCI bridge: VIA Technologies, Inc. VT8237 PCI bridge [K8T800/K8T890
South]
00:09.0 CardBus bridge: ENE Technology Inc CB1410 Cardbus Controller (rev 01)
00:0a.0 Ethernet controller: Atheros Communications, Inc. AR5005G 802.11abg NIC
(rev 01)
00:10.0 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev 80)
00:10.1 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev 80)
00:10.2 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev 80)
00:10.3 USB Controller: VIA Technologies, Inc. USB 2.0 (rev 82)
00:11.0 ISA bridge: VIA Technologies, Inc. VT8235 ISA Bridge
00:11.1 IDE interface: VIA Technologies, Inc.
VT82C586A/B/VT82C686/A/B/VT823x/A/C PIPC Bus Master IDE (rev 06)
00:11.5 Multimedia audio controller: VIA Technologies, Inc. VT8233/A/8235/8237
AC97 Audio Controller (rev 50)
00:11.6 Communication controller: VIA Technologies, Inc. AC'97 Modem Controller
(rev 80)
00:12.0 Ethernet controller: VIA Technologies, Inc. VT6102 [Rhine-II] (rev 74)
00:18.0 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron]
HyperTransport Technology Configuration
00:18.1 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron] Address
Map
00:18.2 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron] DRAM
Controller
00:18.3 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron]
Miscellaneous Control
01:00.0 VGA compatible controller: VIA Technologies, Inc. S3 Unichrome Pro VGA
Adapter (rev 01)

Software Environment:
Debian Sid, Xorg with openchrome drivers from openchrome.org, Software typical
for a Desktop system

Problem Description:
With 2.6.22 according to powertop my system is waking up between 55times a
second and 200 times a second with an average at about 80 times a second.
When I now boot 2.6.24rc7 this number increases to an average of 2500
wakeups/second with (seldom but happening) tops above the 10000 wake-ups/second
mark (to top values of 28000 wake-ups/second!!). This way the CPU is always
running at C0 (99,2%).

Top causes for wakeups (according to powertop):
  42.6% ( 17.6)       <interrupt> : extra timer interrupt 
  21.8% (  9.0)       <interrupt> : ide1
   4.8% (  2.0)       <interrupt> : acpi
   4.1% (  1.7)           xfsbufd : schedule_timeout (process_timeout)
   3.4% (  1.4)              Xorg : do_setitimer (it_real_fn)
   2.4% (  1.0)            dhcdbd : schedule_timeout (process_timeout)
   2.4% (  1.0)         nm-applet : schedule_timeout (process_timeout)
   1.5% (  0.6)     <kernel core> : neigh_table_init_no_netlink
(neigh_periodic_timer)
   1.2% (  0.5)          ifconfig : __netdev_watchdog_up (dev_watchdog)
   1.2% (  0.5)   hald-addon-stor : schedule_timeout (process_timeout)
   1.2% (  0.5)    NetworkManager : schedule_timeout (process_timeout)
   1.2% (  0.5)       gnome-panel : schedule_timeout (process_timeout)
   1.2% (  0.5)   <kernel module> : neigh_table_init_no_netlink
(neigh_periodic_timer)
   1.2% (  0.5)     <kernel core> : queue_delayed_work_on
(delayed_work_timer_fn)
   0.7% (  0.3)       <interrupt> : eth0
   0.7% (  0.3)     <kernel core> : neigh_update (neigh_timer_handler)
   0.7% (  0.3)   <kernel module> : register_sound_midi
(irlmp_discovery_timer_expired)
   0.7% (  0.3)   gnome-cups-icon : schedule_timeout (process_timeout)
   0.7% (  0.3)   gnome-power-man : schedule_timeout (process_timeout)
   0.5% (  0.2)       <interrupt> : ide0
   0.5% (  0.2)    mapping-daemon : schedule_timeout (process_timeout)
   0.5% (  0.2)   gnome-cups-icon : futex_wait (hrtimer_wakeup)
   0.5% (  0.2)              init : schedule_timeout (process_timeout)
   0.5% (  0.2)             cupsd : schedule_timeout (process_timeout)
   0.5% (  0.2)          nautilus : schedule_timeout (process_timeout)
   0.5% (  0.2)   gnome-settings- : schedule_timeout (process_timeout)
   0.5% (  0.2)   <kernel module> : ide_do_rw_disk (ledtrig_ide_timerfunc)
   0.2% (  0.1)            urxvtd : schedule_timeout (process_timeout)
   0.2% (  0.1)           syslogd : do_setitimer (it_real_fn)
   0.2% (  0.1)          gconfd-2 : schedule_timeout (process_timeout)
   0.2% (  0.1)     <kernel core> : page_writeback_init (wb_timer_fn)

Steps to reproduce:

Boot system with 2.6.24-rc7


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
