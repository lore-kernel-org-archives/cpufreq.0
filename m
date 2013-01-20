From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH 3/6] cpufreq: Make acpi-cpufreq link first
Date: Sun, 20 Jan 2013 11:24:27 +0100
Message-ID: <1358677470-17394-4-git-send-email-bp@alien8.de>
References: <1358677470-17394-1-git-send-email-bp@alien8.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358677478; bh=BuvNMQ0hbDPqfNzBhgAnxJlcjrJ3wlEDn7ixP4KjIJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=EXq/
	vUFiF4kMB8ZLX7grCgLFxH+Y2munAqZ3lEnWKpnyhPzIhMvFA7w4C/Py5bVBCgTlZES
	zI8eU8t5U5SNrJXyVMYsBEHIGD5aNpczUueJt8Ot6zhlluhZYrxwj4sXrFLDxP6Wtph
	zecTxmAEisDJ/USTzSl1WqlC37AGbA0lA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358677477; bh=BuvNMQ0hbDPqfNzBhgAnxJlcjrJ3wlEDn7ixP4KjIJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=J5G3
	A8sXMSmbxNA0cVumHSRaXS7FbE1wq2nhJHKaaKkzp7GM8CfuU59oFhRzVflY8ISY6FL
	udKKSR4HkGjlCD3FvyicX3m3FO+EEbb3O9SpeexmcSofh+LTqveDebc1T/60RRLi6OI
	qZ6aRgOVThKjLK82wZyPrus38CGSaZwVA=
In-Reply-To: <1358677470-17394-1-git-send-email-bp@alien8.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: =?UTF-8?q?Andr=C3=A9=20Przywara?= <andre@andrep.de>, Leonid Isaev <lisaev@umail.iu.edu>, Tom Gundersen <teg@jklm.no>, cpufreq@vger.kernel.org, linux-acpi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>

From: Borislav Petkov <bp@suse.de>

Now that the majority of x86 CPUs out there are supported by
acpi-cpufreq, we want it to load first and, in the AMD case, drop to
powernow-k8 only on K8s. If, however, both powernow-k8 and acpi-cpufreq
are built-in, the link order matters. Correct that.

Signed-off-by: Borislav Petkov <bp@suse.de>
---
 drivers/cpufreq/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index fadc4d496e2f..24d4a63fd6cf 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -19,11 +19,12 @@ obj-$(CONFIG_GENERIC_CPUFREQ_CPU0)	+= cpufreq-cpu0.o
 ##################################################################################
 # x86 drivers.
 # Link order matters. K8 is preferred to ACPI because of firmware bugs in early
-# K8 systems. ACPI is preferred to all other hardware-specific drivers.
+# K8 systems. This is still the case but acpi-cpufreq errors out so that
+# powernow-k8 can load then. ACPI is preferred to all other hardware-specific drivers.
 # speedstep-* is preferred over p4-clockmod.
 
-obj-$(CONFIG_X86_POWERNOW_K8)		+= powernow-k8.o
 obj-$(CONFIG_X86_ACPI_CPUFREQ)		+= acpi-cpufreq.o mperf.o
+obj-$(CONFIG_X86_POWERNOW_K8)		+= powernow-k8.o
 obj-$(CONFIG_X86_PCC_CPUFREQ)		+= pcc-cpufreq.o
 obj-$(CONFIG_X86_POWERNOW_K6)		+= powernow-k6.o
 obj-$(CONFIG_X86_POWERNOW_K7)		+= powernow-k7.o
-- 
1.8.1.rc3
