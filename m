From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [PATCH][retry] Allow Powernow-k8 to use _PSD
Date: Thu, 7 Feb 2008 14:55:42 -0600
Message-ID: <1449F58C868D8D4E9C72945771150BDF020772E4@SAUSEXMB1.amd.com>
References: <200802071246.44728.mark.langsdorf@amd.com>
	<20080207191405.GA20383@codemonkey.org.uk>
	<200802072047.22344.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <200802072047.22344.rjw@sisk.pl>
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
To: "Rafael J. Wysocki" <rjw@sisk.pl>, Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

> > It was dropped because it caused regressions on some systems.
> > (I sent you mail about this last month when it got dropped, 
> > but I don't think I saw a reply?)

Apparently my mailer is eating your emails to me.  I
didn't see either message.

> > Rafael (CC'd) saw the problem and narrowed it to this 
> specific patch.
> 
> Yes, it broke suspend on my hp nx6325.

Okay.

Rafael, I'll contact you separately and try to get this
fixed.

-Mark Langsdorf
Operating System Research Center
AMD
