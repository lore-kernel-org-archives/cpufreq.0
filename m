From: Daniel Drake <dsd@gentoo.org>
Subject: Re: Bad page state on AMD Opteron Dual System with kernel
	2.6.13-rc6-git13
Date: Sun, 28 Aug 2005 01:20:51 +0100
Message-ID: <43110363.7020808@gentoo.org>
References: <20050826165342.GA11796@pbkg4>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050826165342.GA11796@pbkg4>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Weippert <weiti@security.tds.de>
Cc: akpm@osdl.org, cpufreq@lists.linux.org.uk, discuss@x86-64.org, linux-kernel@vger.kernel.org, davej@codemonkey.org.uk

Hi,

Tim Weippert wrote:
> i have read some postings concerning the following Kernel Messages:
> 
> Aug 26 18:04:01 montdsnsu3 kernel: grep[11619] general protection
> rip:2aaaaaaaed43 rsp:7fffff9c0740 error:0
> Aug 26 18:08:02 montdsnsu3 kernel: ping[14867] general protection
> rip:2aaaaaaaed43 rsp:7fffffdbf300 error:0
> Aug 26 18:08:03 montdsnsu3 kernel: grep[14987] general protection
> rip:2aaaaaaaed43 rsp:7fffffdbfce0 error:0
> Aug 26 18:08:03 montdsnsu3 kernel: grep[15041] general protection
> rip:2aaaaaaaed43 rsp:7fffff9bf550 error:0
> 
> And the Bad Page State Messages:
> 
> Bad page state at prep_new_page (in process 'sh', page ffff8100011a69c8)
> flags:0x0100000000000014 mapping:0000000000000000 mapcount:-3 count:0
> Backtrace:
> 
> Call Trace:<ffffffff8015a653>{bad_page+99}
> <ffffffff8015aa31>{prep_new_page+65}
>        <ffffffff8015b1e2>{buffered_rmqueue+306}
> <ffffffff8015b425>{__alloc_pages+261}
>        <ffffffff8015b7c5>{get_zeroed_page+37}
> <ffffffff801691b7>{__pmd_alloc+55}
>        <ffffffff8016614e>{copy_page_range+462}
> <ffffffff80131da4>{copy_mm+820}
>        <ffffffff80132cba>{copy_process+2282}
> <ffffffff80133407>{do_fork+215}
>        <ffffffff8010db7a>{system_call+126}
> <ffffffff8010deeb>{ptregscall_common+103}
>        
> Trying to fix it up, but a reboot is needed

Seems to be an identical problem as was filed here:

	http://bugs.gentoo.org/show_bug.cgi?id=103497

This bug report seems to suggest that the ondemand scaling governor may be at 
fault. Does your setup use this too?

(CC'ing some extra people to make sure problem is known)

> 
> I have the same issues on an SUN V20z with an dual opteron 248.
> 
> montdsnsu3:~# lspci
> 0000:00:06.0 PCI bridge: Advanced Micro Devices [AMD] AMD-8111 PCI (rev
> 07)
> 0000:00:07.0 ISA bridge: Advanced Micro Devices [AMD] AMD-8111 LPC (rev
> 05)
> 0000:00:07.1 IDE interface: Advanced Micro Devices [AMD] AMD-8111 IDE
> (rev 03)
> 0000:00:07.3 Bridge: Advanced Micro Devices [AMD] AMD-8111 ACPI (rev 05)
> 0000:00:0a.0 PCI bridge: Advanced Micro Devices [AMD] AMD-8131 PCI-X
> Bridge (rev 12)
> 0000:00:0a.1 PIC: Advanced Micro Devices [AMD] AMD-8131 PCI-X APIC (rev
> 01)
> 0000:00:0b.0 PCI bridge: Advanced Micro Devices [AMD] AMD-8131 PCI-X
> Bridge (rev 12)
> 0000:00:0b.1 PIC: Advanced Micro Devices [AMD] AMD-8131 PCI-X APIC (rev
> 01)
> 0000:00:18.0 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
> 0000:00:18.1 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
> 0000:00:18.2 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
> 0000:00:18.3 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
> 0000:00:19.0 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
> 0000:00:19.1 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
> 0000:00:19.2 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
> 0000:00:19.3 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
> 0000:01:00.0 USB Controller: Advanced Micro Devices [AMD] AMD-8111 USB
> (rev 0b)
> 0000:01:00.1 USB Controller: Advanced Micro Devices [AMD] AMD-8111 USB
> (rev 0b)
> 0000:01:05.0 VGA compatible controller: Trident Microsystems Blade 3D
> PCI/AGP (rev 3a)
> 0000:02:02.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5704
> Gigabit Ethernet (rev 03)
> 0000:02:02.1 Ethernet controller: Broadcom Corporation NetXtreme BCM5704
> Gigabit Ethernet (rev 03)
> 0000:02:04.0 SCSI storage controller: LSI Logic / Symbios Logic 53c1030
> PCI-X Fusion-MPT Dual Ultra320 SCSI (rev 08)
> 
> 
> With the running kernel i get 2 kernel panics within the last week and
> the machine crash totally.
> 
> I would like to offer my help if i can do anything in debugging this or
> deal with more informations to fix this issue.
> 
> HTH, 
> 
>     weiti
> 
