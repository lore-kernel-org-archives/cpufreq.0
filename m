From: "Jan Beulich" <jbeulich@novell.com>
Subject: Re: [PATCH] kernel crash in powernow-k8 after lost ticks
	detected
Date: Mon, 27 Mar 2006 17:56:27 +0200
Message-ID: <4428193C020000780001454E@emea1-mh.id2.novell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: linux@dominikbrodowski.net
Cc: Pavel Machek <pavel@suse.de>, cpufreq@lists.linux.org.uk, mark.langsdorf@amd.com, davej@redhat.com

>>> Dominik Brodowski <linux@dominikbrodowski.net> 03/26/06 10:25 AM >>>
>cpufreq_driver->get() can get called for _any_ CPU -- that's the semantics
>of that funciton, which I would not want to be changed. Therefore I prefer
>the patch by Andi which fixes powernow-k8.c and which is in Linus' git tree
>by now.

I don't think the patch makes this not work - since it alters the queried CPU only
when the original and the new CPU are in the same policy set anyway, the
result is not going to be different.
Regardless of that, I'm fine with Andi's patch, and if it so be I'm also fine with
this patch being removed again (I understand it also got applied meanwhile)
if Andi's is in Linus' tree.

Jan
