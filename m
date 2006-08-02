From: Dave Jones <davej@redhat.com>
Subject: Re: CPU frequency accessible through smbios interface?
Date: Wed, 2 Aug 2006 14:12:25 -0400
Message-ID: <20060802181225.GH5972@redhat.com>
References: <1154541821.22814.12.camel@skylla.slagter.name>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1154541821.22814.12.camel@skylla.slagter.name>
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
To: Erik Slagter <erik@slagter.name>
Cc: cpufreq@lists.linux.org.uk

On Wed, Aug 02, 2006 at 08:03:41PM +0200, Erik Slagter wrote:
 
 > But probably it's all proprietary, but, one never knows... 

Sadly, this usually is, so unless you have uber reverse engineering
skills, don't expect to see it working.

Also, it's likely it's also adjusting the FSB to offer such
a wide scale of frequencies.  Adjusting the FSB at runtime is
an absolute nightmare to get right.

		Dave
-- 
http://www.codemonkey.org.uk
