From: Adrian Bunk <bunk@stusta.de>
Subject: [-mm patch] make arch/i386/kernel/cpu/cpufreq/longhaul.c:longhaul_walk_callback() static
Date: Sun, 9 Jul 2006 19:53:08 +0200
Message-ID: <20060709175308.GJ13938@stusta.de>
References: <20060709021106.9310d4d1.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030245AbWGIRxL@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060709021106.9310d4d1.akpm@osdl.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, rafalbilski@interia.pl, Dave Jones <davej@redhat.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Sun, Jul 09, 2006 at 02:11:06AM -0700, Andrew Morton wrote:
>...
> Changes since 2.6.17-mm6:
>...
>  git-cpufreq.patch
>...
>  git trees
>...

This patch makes the needlessly global longhaul_walk_callback() static.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.18-rc1-mm1-full/arch/i386/kernel/cpu/cpufreq/longhaul.c.old	2006-07-09 16:29:54.000000000 +0200
+++ linux-2.6.18-rc1-mm1-full/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-07-09 16:30:11.000000000 +0200
@@ -524,9 +524,9 @@
 	return calc_speed(longhaul_get_cpu_mult());
 }
 
-acpi_status longhaul_walk_callback(acpi_handle obj_handle,
-				  u32 nesting_level,
-				  void *context, void **return_value)
+static acpi_status longhaul_walk_callback(acpi_handle obj_handle,
+					  u32 nesting_level,
+					  void *context, void **return_value)
 {
 	struct acpi_device *d;
 
