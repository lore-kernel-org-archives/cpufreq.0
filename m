From: Dave Jones <davej@redhat.com>
Subject: Re: Core2Duo locked at 800MHz
Date: Tue, 27 Nov 2007 14:05:18 -0500
Message-ID: <20071127190518.GC30057@redhat.com>
References: <474A6C62.3070103@reinelt.co.at>
	<20071126190929.GE15764@redhat.com>
	<474BB4F2.9040604@reinelt.co.at>
	<1196160448.23251.21.camel@queen.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1196160448.23251.21.camel@queen.suse.de>
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
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@lists.linux.org.uk

On Tue, Nov 27, 2007 at 11:47:28AM +0100, Thomas Renninger wrote:

 > > > the cpufreq.debug=7 logs would be a good start.
 > 
 > It is probably limited through _PPC again.
 > Dave, Len: Can you please add the patch that _PPC changes are printed
 > with cpufreq.debug, pls.
 > I posted this a while ago on the cpufreq list:
 > Subject: [PATCH] Print _PPC changes via cpufreq debug layer
 > http://article.gmane.org/gmane.linux.kernel.cpufreq/5642

Looks ok to me.  Len, you ok with me merging this?
Or would you rather it went through the acpi git tree?

	Dave

-- 
http://www.codemonkey.org.uk
