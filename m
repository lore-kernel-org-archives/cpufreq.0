From: tony@bakeyournoodle.com (Tony Breeds)
Subject: cpufreq_set_policy removed
Date: Thu, 7 Jun 2007 07:42:43 +1000
Message-ID: <20070606214243.GX15955@bakeyournoodle.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk

Hi All,
	The git commit  632786ce9ff6206951ee4c84fe5c0d5c1d12f4cc reomved
the "deprecated and buggy" cpufreq_set_policy().  In the linux powerpc
tree we have a driver that's using it.

Offending function:
---
static void cbe_cpufreq_handle_pmi(struct of_device *dev, pmi_message_t pmi_msg)
{
	struct cpufreq_policy policy;
	u8 cpu;
	u8 cbe_pmode_new;

	BUG_ON(pmi_msg.type != PMI_TYPE_FREQ_CHANGE);

	cpu = cbe_node_to_cpu(pmi_msg.data1);
	cbe_pmode_new = pmi_msg.data2;

	cpufreq_get_policy(&policy, cpu);

	policy.max = min(policy.max, cbe_freqs[cbe_pmode_new].frequency);
	policy.min = min(policy.min, policy.max);

	pr_debug("cbe_handle_pmi: new policy.min=%d policy.max=%d\n", policy.min, policy.max);
	cpufreq_set_policy(&policy);
}
---

What is the correct API to use now?

Yours Tony

  linux.conf.au        http://linux.conf.au/ || http://lca2008.linux.org.au/
  Jan 28 - Feb 02 2008 The Australian Linux Technical Conference!
