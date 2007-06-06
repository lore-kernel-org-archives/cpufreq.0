From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: cpufreq_set_policy removed
Date: Thu, 07 Jun 2007 09:01:18 +1000
Message-ID: <1181170878.31677.272.camel@localhost.localdomain>
References: <20070606214243.GX15955@bakeyournoodle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20070606214243.GX15955@bakeyournoodle.com>
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
To: Tony Breeds <tony@bakeyournoodle.com>
Cc: davej@codemonkey.org.uk, Christian Krafft <krafft@de.ibm.com>, cpufreq@lists.linux.org.uk

On Thu, 2007-06-07 at 07:42 +1000, Tony Breeds wrote:
> Hi All,
> 	The git commit  632786ce9ff6206951ee4c84fe5c0d5c1d12f4cc reomved
> the "deprecated and buggy" cpufreq_set_policy().  In the linux powerpc
> tree we have a driver that's using it.

Ugh... we still use it ? I though we had fixed that ...

CC'ing Christian who maintains the CBE cpufreq driver.

Ben.
