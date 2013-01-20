From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH 0/6] acpi-cpufreq and powernow-k8 fixes
Date: Sun, 20 Jan 2013 11:24:24 +0100
Message-ID: <1358677470-17394-1-git-send-email-bp@alien8.de>
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358677478; bh=1WFyvf0vj7kPyxjz11Lkm0fPYHNDwzQ2bPf0tdD5d2g=;
	h=From:To:Cc:Subject:Date:Message-Id; b=WBEZ4xNsj7HjdR8837/HJv6COpk
	l7maJnRZccr0zUygx0EAyyOG3vPl9ay5GxuGs6OIx8lZJOYPZcgPOUa1GBywSoCDbT2
	8wzuPRwrptF0CFWwdJQ94Q7n2PAl+d0oHHeBH2W+B8PlWednxvx9sAt2TGWec0yA2QS
	+H3F3U2hBM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358677477; bh=1WFyvf0vj7kPyxjz11Lkm0fPYHNDwzQ2bPf0tdD5d2g=;
	h=From:To:Cc:Subject:Date:Message-Id; b=K7kRpBrJMpTfdJpOK5fSnM4yVhe
	2/epqZNDiD3F+YmUlLRKGyENSwPf0+eflPUVf5qY8iuKRg18uHE0oPx0yFdkCNjyWR+
	8nEJprGhO8trZAgTtUCsp3/7ldsLVRTOFci7v8U4JELiKbaCQEIiSXBFgyItRyvi7bu
	LzDCkJn6oM=
Sender: linux-acpi-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: =?UTF-8?q?Andr=C3=A9=20Przywara?= <andre@andrep.de>, Leonid Isaev <lisaev@umail.iu.edu>, Tom Gundersen <teg@jklm.no>, cpufreq@vger.kernel.org, linux-acpi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>

From: Borislav Petkov <bp@suse.de>

Hi all,

here are a couple of patches fixing acpi-cpufreq and powernow-k8 loading
sequence and handoff.

Patch 0001 should be in Rafael's tree already but I'm adding it here for
the sake of completeness. Basically, we want to address all possible
cases of powernow-k8 and acpi-cpufreq:

(M: module, Y: built-in)

powernow-k8		acpi-cpufreq
M			M		- powernow-k8 requests acpi-cpufreq
M			Y		- powernow-k8 sees already loaded acpi-cpufreq
Y			M		- impossible after patch 0001
Y			Y		- patches 2,3 fix that

Anyway, please take a look and let me know.

Thanks.




Borislav Petkov (5):
  powernow-k8: Add a kconfig dependency on acpi-cpufreq
  cpufreq: Make acpi-cpufreq link first
  cpufreq: Add a get_current_driver helper
  powernow-k8: Cleanup module request
  powernow-k8: Cleanup init function

Matthew Garrett (1):
  acpi-cpufreq: Do not load on K8

 drivers/cpufreq/Kconfig.x86    |  2 +-
 drivers/cpufreq/Makefile       |  5 +++--
 drivers/cpufreq/acpi-cpufreq.c |  6 ++++++
 drivers/cpufreq/cpufreq.c      | 14 +++++++++++++
 drivers/cpufreq/powernow-k8.c  | 46 ++++++++++++++++++++++++++++++------------
 include/linux/cpufreq.h        |  1 +
 6 files changed, 58 insertions(+), 16 deletions(-)

-- 
1.8.1.rc3

