From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Sun, 20 Feb 2005 15:51:57 +0100
Message-ID: <20050220145157.GC20702@isilmar.linta.de>
References: <20050220131518.GB4495@inskipp>
	<1108908764.6282.59.camel@laptopd505.fenrus.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1108908764.6282.59.camel@laptopd505.fenrus.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arjan van de Ven <arjan@infradead.org>
Cc: davej@redhat.com, alex-kernel@digriz.org.uk, Alexander Clouter <alex@digriz.org.uk>, cpufreq@lists.linux.org.uk

On Sun, Feb 20, 2005 at 03:12:44PM +0100, Arjan van de Ven wrote:
> On Sun, 2005-02-20 at 13:15 +0000, Alexander Clouter wrote:
> > Adds support to cpufreq_ondemand to ignore 'nice' cpu time
> 
> this increasingly starts to smell like it wants this policy in
> userspace.....

There are enough userspace cpufreq daemons already. However, the policy
decision back then was to prefer governing CPU frequencies in the following
order:
a) hardware
b) kernelspace
c) userspace

http://marc.theaimsgroup.com/?t=103053598900004&r=2&w=2

and two decisive posts:

http://marc.theaimsgroup.com/?l=linux-kernel&m=103056055008566&w=2
http://marc.theaimsgroup.com/?l=linux-kernel&m=103056413012458&w=2

Thanks,
	Dominik
