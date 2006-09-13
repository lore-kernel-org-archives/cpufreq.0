From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: [PATCH 2.6.18-rc6-mm2] sw_any_bug_dmi_table can be used on resume,
 so it isn't initdata
Date: Tue, 12 Sep 2006 18:55:53 -0700
Message-ID: <45076529.6040106@goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751490AbWIMB4I@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@osdl.org>, Dave Jones <davej@redhat.com>, Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

sw_any_bug_dmi_table can be used on resume, so it isn't initdata.

Signed-off-by: Jeremy Fitzhardinge <jeremy@goop.org>

diff -r 3bf6c0c79dba arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	Tue Sep 12 01:37:21 2006 -0700
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	Tue Sep 12 18:51:41 2006 -0700
@@ -393,7 +393,7 @@ static int __init sw_any_bug_found(struc
 }
 
 
-static struct dmi_system_id __initdata sw_any_bug_dmi_table[] = {
+static struct dmi_system_id sw_any_bug_dmi_table[] = {
 	{
 		.callback = sw_any_bug_found,
 		.ident = "Supermicro Server X6DLP",

