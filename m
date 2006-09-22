From: Ryan Underwood <nemesis@icequake.net>
Subject: Re: writing a cpufreq driver
Date: Fri, 22 Sep 2006 11:01:18 -0500
Message-ID: <20060922160118.GB4459@dbz.icequake.net>
References: <20060921184833.GC1216@dbz.icequake.net>
	<20060921193141.GE17065@redhat.com>
	<20060921200851.GF2364@dbz.icequake.net>
	<20060921204402.GA26683@redhat.com>
	<20060921210329.GA16590@dbz.icequake.net>
	<20060921211343.GG26683@redhat.com>
	<20060922141318.GE24439@dbz.icequake.net>
	<20060922143954.GF24439@dbz.icequake.net>
	<20060922154821.GP4945@poupinou.org>
Reply-To: nemesis@icequake.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060922154821.GP4945@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Dave Jones <davej@redhat.com>, Cpufreq@lists.linux.org.uk, nemesis@icequake.net


On Fri, Sep 22, 2006 at 05:48:21PM +0200, Bruno Ducrot wrote:
> 
> I've seen toshiba laptop using throttling when HCI is used.
> If you have the datasheet of the southbridge I think we should be
> able to verify this hypothesis.

It's a Toshiba integrated south bridge/super IO, so no luck there.
I'll try to find another laptop to test it on.

-- 
Ryan Underwood, <nemesis@icequake.net>
