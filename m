From: Sebastian Witt <hasw@hasw.net>
Subject: Re: Memory leak in cpufreq-nforce2.c
Date: Fri, 24 Aug 2007 19:43:38 +0200
Message-ID: <46CF18CA.1020209@hasw.net>
References: <46CD7BE6.5040904@tnode.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <46CD7BE6.5040904@tnode.com>
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
To: GW <gw.kernel@tnode.com>
Cc: cpufreq@lists.linux.org.uk

Hello,

GW wrote:

> 
> This means that there are some memory leaks in the following driver that uses pci_get_subsys(), but no pci_dev_put():
> 

Yes, pci_dev_put(nforce2_chipset_dev) is missing in nforce2_exit()...

> I don't have this chip, therefore I couldn't test a patch if I would written it.

...unfortunately I don't own the original hardware with nForce2 chipset anymore.
     I don't think a patch for correcting this bug modifies the expected
behaviour...but it should be tested by someone who ones compatible hardware.

Regards,
Sebastian
