From: Jiri Hladky <hladky.jiri@seznam.cz>
Subject: Re: Pentium III Coppermine
Date: Mon, 18 Oct 2004 12:31:36 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200410181231.36045.hladky.jiri@seznam.cz>
References: <33222.14179-2631-1010294146-1097668908@email.seznam.cz>
	<200410151241.03188.hladky.jiri@seznam.cz>
	<20041016164253.GA8135@dominikbrodowski.de>
Reply-To: hladky.jiri@seznam.cz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041016164253.GA8135@dominikbrodowski.de>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: aeriksson@fastmail.fm, cpufreq@www.linux.org.uk

Hi Anders & Dominik,

yesterday, I have compiled kernel 2.6.6 and speedstep is now working just 
fine! 

Thank you very much for your help!
Jiri

On Saturday 16 October 2004 18:42, Dominik Brodowski wrote:
> Status: R
> X-Status: N
> X-KMail-EncryptionState:
> X-KMail-SignatureState:
> X-KMail-MDN-Sent:
>
> On Fri, Oct 15, 2004 at 12:41:03PM +0200, Jiri Hladky wrote:
> > Hi Anders & Dominik,
> >
> > I have tried to search for CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK is
> > source files
> >
> > "locate speedstep | grep [.]c$ | xargs grep
> > CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK"
> >
> > but I had no success. It seems like I have to get new sources for
> > cpufreq? My current kernel is 2.6.5
>
> ... and that option got merged into 2.6.6.
>
> 	Dominik
