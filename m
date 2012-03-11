From: Rafal Bilski <rafalbilski@interia.pl>
Subject: [PATCH][RESEND] Mark Longhaul as broken (again)
Date: Sun, 11 Mar 2012 20:24:21 +0000
Message-ID: <1331497461-2397-1-git-send-email-rafalbilski@interia.pl>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
	s=biztos; t=1331497413;
	bh=jGWGx12KyJUEQOwhEZUH9eageDE0EGYTvs7DH+lqzdE=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 X-Interia-Antivirus;
	b=uJsvgaFaNf77BPWBEDHbOt/XX0wu1GEpAUEFNELURPR1+WimlXDWSKBp4s7vcRK4L
	 pff13nz49MGrbc1SQ2CX2LtEt2Qx5f5+2V/x59Fb4IW/9wZLpvPZ6WrDs/kbaccbIA
	 +sE2+IbU8soxTUJoZbWFJmhYazbg1Ozkp3Hh4aZE=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, Rafal Bilski <rafalbilski@interia.pl>

I'm very sorry, but I don't see how bug 4059 could be fixed. In thread
pointed by one of links user claims that his processor isn't even stable
at lower frequencies. I don't see how it is possible because most VIA
systems don't support voltage scaling. Reason I can think of is
some processors need much more then 1ms to change frequency and are
still in process of doing so when timer interrupt occurs (1000Hz timer
and "ondemand" scenario). Another possibility is that some interrupts
can't be masked even when asked to. And another one is SMI which isn't
adressed by current source at all.

Current Longhaul is much different then older one yet limiting it to
known to work northbridges didn't help. Possibly support depends on
chipset revision or system setup.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 drivers/cpufreq/Kconfig.x86 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
index 78ff7ee..4ae0f5c 100644
--- a/drivers/cpufreq/Kconfig.x86
+++ b/drivers/cpufreq/Kconfig.x86
@@ -215,7 +215,7 @@ config X86_LONGRUN
 config X86_LONGHAUL
 	tristate "VIA Cyrix III Longhaul"
 	select CPU_FREQ_TABLE
-	depends on X86_32 && ACPI_PROCESSOR
+	depends on X86_32 && ACPI_PROCESSOR && BROKEN
 	help
 	  This adds the CPUFreq driver for VIA Samuel/CyrixIII,
 	  VIA Cyrix Samuel/C3, VIA Cyrix Ezra and VIA Cyrix Ezra-T
-- 
1.7.9.3

