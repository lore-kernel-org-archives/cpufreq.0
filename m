From: antoine <rouadec@gmail.com>
Subject: Re: voltage on an intel dual core L2400 @ 1.66GHz
Date: Thu, 24 Aug 2006 08:23:29 -0700
Message-ID: <e2219c8a0608240823y6d334d26o9b5b9f13f9d68e5a@mail.gmail.com>
References: <e2219c8a0608221447n115309ewd55212ce4e5e9342@mail.gmail.com>
	<200608222225.25264.len.brown@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <200608222225.25264.len.brown@intel.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

ok, I didn't get round to do a full test with bltk but it seems my
first impressions were wrong (not that I was extremly confident in
them to start with).

the shorten battery life seems to be a fan always on issue, the CPU
temp is low enough (well the fan is allways running) at 45/50 celsius.
After checking the blueprints it seems that what was burning my
fingers was the mini PCI express wireless card...

Sorry for the clueless questions and thanks for the help.

I may be able to provide some informations about my CPU if you guys
need it to built the tables for linux-PHC :
Genuine Intel(R) CPU           L2400  @ 1.66GHz

Once again, thanks

On 8/22/06, Len Brown <len.brown@intel.com> wrote:
> On Tuesday 22 August 2006 17:47, antoine wrote:
> > Hello,
> >
> > Just got this x60s, everything runs smoothly but for one thing which
> > is the battery life being 40% shorter and the whole computer running
> > hotter than "usual" (i.e. the 4 days I spend with windows on it).
> >
> > I suspect the voltage associated to each frequency by cpufreq are too
> > high but couldn't find a way to check those as of now. I don't really
> > want to lower them, I was just wondering how they were set?
> >
> > I know about the linux-PHC patch, but it seems this is only if you
> > wish to lower the default voltages, I merely wish to know what my
> > current ones are right now.
>
> It might be a good idea to get an objective measurement
> of the Linux battery life on the system:
>
> http://sourceforge.net/projects/bltk
>
> cheers,
> -Len
>


-- 
Antoine
http://delaunay.org/antoine
