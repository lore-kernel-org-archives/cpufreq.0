From: Dave Young <hidave.darkstar@gmail.com>
Subject: [PATCH][resend]gx-suspmod.c use boot_cpu_data instead of current_cpu_data
Date: Wed, 17 Oct 2007 13:47:30 +0800
Message-ID: <20071017054729.GA7741@darkstar.te-china.tietoenator.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758767AbXJQFsk@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:received:date:from:to:cc:subject:message-id:mime-version:content-type:content-disposition:user-agent;
        bh=wRZTp+ZvljyRsQVzMluY0R2Bj0Cs/dCbB4lrSlv6vhQ=;
        b=mRxRgc+Kwjn951fWCBypyDCOGWaKzeNquiOlPqFN5pVtB9AvElQowT5J4zQGhhaZVpPH+lWEHCGqolz2WnkcQ2MbZpzoE0X/ue6j/owAlvVSGH7oSXChFmpnzwkaLyMIhE352VlYrn9N82WYeRFpihCC0F7npWmJqyCaH2fWPJs=
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Dave Jones <davej@codemonkey.org.uk>
Cc: linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

in preemptible kernel will report BUG: using smp_processor_id() in
preemptible, so use boot_cpu_data instead of current_cpu_data.

discussion in :
http://lkml.org/lkml/2007/7/25/32

Signed-off-by: Dave Young <hidave.darkstar@gmail.com> 

---
arch/i386/kernel/cpu/cpufreq/gx-suspmod.c |    4 ++--
1 file changed, 2 insertions(+), 2 deletions(-)

diff -pur linux/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c linux.new/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c
--- linux/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c	2007-07-25 14:11:06.000000000 +0000
+++ linux.new/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c	2007-07-25 13:57:29.000000000 +0000
@@ -181,8 +181,8 @@ static __init struct pci_dev *gx_detect_
 	struct pci_dev *gx_pci = NULL;
 
 	/* check if CPU is a MediaGX or a Geode. */
-	if ((current_cpu_data.x86_vendor != X86_VENDOR_NSC) &&
-	    (current_cpu_data.x86_vendor != X86_VENDOR_CYRIX)) {
+	if ((boot_cpu_data.x86_vendor != X86_VENDOR_NSC) &&
+	    (boot_cpu_data.x86_vendor != X86_VENDOR_CYRIX)) {
 		dprintk("error: no MediaGX/Geode processor found!\n");
 		return NULL;
 	}
