From: Matthew Garrett <mjg@redhat.com>
Subject: [PATCH 4/5] cpufreq: Add compatibility hack to powernow-k8
Date: Tue, 17 May 2011 13:03:38 -0400
Message-ID: <1305651819-25660-4-git-send-email-mjg@redhat.com>
References: <1305651819-25660-1-git-send-email-mjg@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1305651819-25660-1-git-send-email-mjg@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: borislav.petkov@amd.com, davej@redhat.com, mark.langsdorf@amd.com, cpufreq@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

cpufreq modules are often loaded from init scripts that assume that all
recent AMD systems will use powernow-k8, so we should ensure that loading
it triggers a load of acpi-cpufreq if the latter is built as a module.
This avoids the problem of users ending up without any cpufreq support
after the transition.

Signed-off-by: Matthew Garrett <mjg@redhat.com>
---
 arch/x86/kernel/cpu/cpufreq/powernow-k8.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index 2368e38..619733e 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@ -1538,6 +1538,8 @@ static int __cpuinit powernowk8_init(void)
 	unsigned int i, supported_cpus = 0, cpu;
 	int rv;
 
+	request_module("acpi_cpufreq");
+
 	for_each_online_cpu(i) {
 		int rc;
 		smp_call_function_single(i, check_supported_cpu, &rc, 1);
-- 
1.7.5
