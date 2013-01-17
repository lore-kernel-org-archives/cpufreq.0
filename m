From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] powernow-k8: Add a kconfig dependency on acpi-cpufreq
Date: Thu, 17 Jan 2013 12:58:44 +0100
Message-ID: <20130117115844.GB3853@pd.tnic>
References: <1357780161-30581-1-git-send-email-Aravind.Gopalakrishnan@amd.com>
 <20130111144940.GB21882@liondog.tnic>
 <20130111165054.GD10751@liondog.tnic>
 <4923C2DE085EEB4FAB1D375DD09D0BA6100CF170@sausexdag04.amd.com>
 <20130117115436.GA3853@pd.tnic>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358423926; bh=jUAAXU941NMZnPJM1b1emrzIOgol8/JUkpL9CGPVvSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=BB+VIEC2uXtjIaY/5kZJ1Yv6qTA11cSxAhFVmL
	rxkfH3ZMUW3o5+E+cRoJUIDYcCSM6RJ2E96Msg5QbBXQEzAmlkV/UHGm1YreoUMEtBe
	v4I1yEC8IyPJFS+SGWT+8/F0YY8C/Vu9rtv+HF0IC4cwDxMayh26swo9euyyf8aDn8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358423925; bh=jUAAXU941NMZnPJM1b1emrzIOgol8/JUkpL9CGPVvSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=UAbMlCKsIk415uXTu1Q19v/DIss0vVLEqiNtNl
	INMIHp+SUNxEtj2ZZp4GQyRH16eXe2wBf+DQyQcN6iA9FzjLn/T0uKdNkHsGBshDDww
	780D+b5zSHExTBK50kHD4sbKtuzrrG0bPUa6JGKxNbQTIhJneBDfDwMdeSipcBsZmM=
Content-Disposition: inline
In-Reply-To: <20130117115436.GA3853@pd.tnic>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "rjw@sisk.pl" <rjw@sisk.pl>
Cc: "Gopalakrishnan, Aravind" <Aravind.Gopalakrishnan@amd.com>, Andre Przywara <andre@andrep.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andreas <linuxuser330250@gmx.net>

From: Borislav Petkov <bp@suse.de>
Date: Thu, 17 Jan 2013 12:44:20 +0100
Subject: [PATCH] powernow-k8: Add a kconfig dependency on acpi-cpufreq

Andreas reports in https://bugzilla.kernel.org/show_bug.cgi?id=51741
that with his Gentoo config, acpi-cpufreq wasn't enabled and powernow-k8
couldn't handoff properly to acpi-cpufreq leading to running without
P-state support (i.e., cores are constantly in P0).

To alleaviate that, we need to make powernow-k8 depend on acpi-cpufreq
so that acpi-cpufreq is always present.

Cc: Andre Przywara <andre@andrep.de>
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


-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
