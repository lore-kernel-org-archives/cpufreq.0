From: tony@bakeyournoodle.com (Tony Breeds)
Subject: Re: cpufreq_set_policy removed
Date: Thu, 7 Jun 2007 11:03:46 +1000
Message-ID: <20070607010346.GA15955@bakeyournoodle.com>
References: <20070606214243.GX15955@bakeyournoodle.com>
	<1181170878.31677.272.camel@localhost.localdomain>
	<20070606231342.GA16771@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20070606231342.GA16771@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christian Krafft <krafft@de.ibm.com>, cpufreq@lists.linux.org.uk

On Wed, Jun 06, 2007 at 07:13:43PM -0400, Dave Jones wrote:
> On Thu, Jun 07, 2007 at 09:01:18AM +1000, Ben Herrenschmidt wrote:
>  > On Thu, 2007-06-07 at 07:42 +1000, Tony Breeds wrote:
>  > > Hi All,
>  > > 	The git commit  632786ce9ff6206951ee4c84fe5c0d5c1d12f4cc reomved
>  > > the "deprecated and buggy" cpufreq_set_policy().  In the linux powerpc
>  > > tree we have a driver that's using it.
>  > 
>  > Ugh... we still use it ? I though we had fixed that ...
>  > 
>  > CC'ing Christian who maintains the CBE cpufreq driver.
> 
> Thomas mailed the following patch a few weeks ago..

Thanks Dave and Thomas.

We'll see what we can do about getting this tested and pushed.

Yours Tony

  linux.conf.au        http://linux.conf.au/ || http://lca2008.linux.org.au/
  Jan 28 - Feb 02 2008 The Australian Linux Technical Conference!
