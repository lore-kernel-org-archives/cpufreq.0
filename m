From: GW <gw.kernel@tnode.com>
Subject: Memory leak in cpufreq-nforce2.c
Date: Thu, 23 Aug 2007 14:21:58 +0200
Message-ID: <46CD7BE6.5040904@tnode.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

Hello.

I accidentally found something missing in cpufreq-nforce2.c and asked on linux-pci mailing list about it:

Greg KH wrote:
> On Wed, Aug 22, 2007 at 11:27:29PM +0200, GW wrote:
>> I was wondering if after every usage of pci_get_subsys() when you
>> don't need the device anymore you need to call pci_dev_put(dev)?
> 
> Yes, that is a requirement.
> 
> I don't understand why you would think it would not be necessary.

This means that there are some memory leaks in the following driver that uses pci_get_subsys(), but no pci_dev_put():

arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
  in function nforce2_fsb_read()
  in function __exit nforce2_exit(), because in __init nforce2_init() it calls nforce2_detect_chipset() that doesn't release the device

I don't have this chip, therefore I couldn't test a patch if I would written it.


    gw
