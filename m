From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: speedstep capability checks
Date: Tue, 16 Mar 2004 17:36:04 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040316163604.GK28592@poupinou.org>
References: <20040314152016.0B04B3F04@latitude.mynet.no-ip.org>
	<20040315141517.GG8636@dominikbrodowski.de>
	<20040315210950.GC15243@redhat.com>
	<20040316073847.GA7597@dominikbrodowski.de>
	<20040316130114.GA13713@redhat.com>
	<20040316160043.GB7322@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040316160043.GB7322@dominikbrodowski.de>
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
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, aeriksson@fastmail.fm, Arjan van de Ven <arjanv@redhat.com>, cpufreq@www.linux.org.uk

> >  > Allow a relaxed checking for one such issue by a module 
> >  > parameter only available if a config option is turned on. This is done to 
> >  > avoid the risk of doing invalid speedstep instructions on systems which do 
> >  > not support it, and which might even lead to (hardware) failure.
> > 
> > I'd merge this really as a last resort, and it's beginning to sound like
> > we don't really have any options (other than not support those broken boxes). Ugh.
> 
> I'd much prefer if the check posted on Intel's website were accurate, too,
> and wouldn't have false negatives. (I doubt it has false positives).

By now, I have seen only one real false positive and it was for
speedstep-smi.

Now that we are talking about, I'm wondering if there are OEMs stupid
enough to make a kind of throttling blurb via that interface?

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
