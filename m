From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH 1/6] powernow-k8: Add a kconfig dependency on acpi-cpufreq
Date: Sun, 20 Jan 2013 11:24:25 +0100
Message-ID: <1358677470-17394-2-git-send-email-bp@alien8.de>
References: <1358677470-17394-1-git-send-email-bp@alien8.de>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358677478; bh=cqjDS0i64XxF/UXa0wEPqKCSAdMnwo/4Bk3wboHtpfU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=sRaQ
	rC8FXvW7EQvKG7ur+5maFvBRc+njGSMyKrkTqNBunkGpNCHopbtaAcjffMsgL7X6XwU
	AyrDg+OZLLJFvR4w6wwGInuLxLZ84DtxMvJQ3GRSU8dYiDofmWWLld6/oDC5/2QmGDg
	9dWI4Wl2cedYCpmFhjD4wHAJ9oVjVGiPM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358677477; bh=cqjDS0i64XxF/UXa0wEPqKCSAdMnwo/4Bk3wboHtpfU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=BBk+
	2FEhtL3wdfM7Bep+FhaK5nkaOEhIQZd9RKmnnaAf9vWQ5e2dQTxrVWauFgfxGYZ568O
	qdqTGdCoCHfvZsXVT64YtpYkhGlFemmYlY87JrGUtJFs11C0TBkBweVxbcOgHkNIkm4
	Yf+uOlrCDZQCjFkShLBmYv1ot6X+Xd3d4=
In-Reply-To: <1358677470-17394-1-git-send-email-bp@alien8.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: =?UTF-8?q?Andr=C3=A9=20Przywara?= <andre@andrep.de>, Leonid Isaev <lisaev@umail.iu.edu>, Tom Gundersen <teg@jklm.no>, cpufreq@vger.kernel.org, linux-acpi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>

From: Borislav Petkov <bp@suse.de>

Andreas reports in https://bugzilla.kernel.org/show_bug.cgi?id=51741
that with his Gentoo config, acpi-cpufreq wasn't enabled and powernow-k8
couldn't handoff properly to acpi-cpufreq leading to running without
P-state support (i.e., cores are constantly in P0).

To alleaviate that, we need to make powernow-k8 depend on acpi-cpufreq
so that acpi-cpufreq is always present.

Reported-by: Andreas <linuxuser330250@gmx.net>
Signed-off-by: Borislav Petkov <bp@suse.de>
---
 drivers/cpufreq/Kconfig.x86 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
index 934854ae5eb4..7227cd734042 100644
--- a/drivers/cpufreq/Kconfig.x86
+++ b/drivers/cpufreq/Kconfig.x86
@@ -106,7 +106,7 @@ config X86_POWERNOW_K7_ACPI
 config X86_POWERNOW_K8
 	tristate "AMD Opteron/Athlon64 PowerNow!"
 	select CPU_FREQ_TABLE
-	depends on ACPI && ACPI_PROCESSOR
+	depends on ACPI && ACPI_PROCESSOR && X86_ACPI_CPUFREQ
 	help
 	  This adds the CPUFreq driver for K8/early Opteron/Athlon64 processors.
 	  Support for K10 and newer processors is now in acpi-cpufreq.
-- 
1.8.1.rc3

