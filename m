From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: speedstep capability checks
Date: Fri, 19 Mar 2004 12:06:37 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040319110637.GF28592@poupinou.org>
References: <20040316163604.GK28592@poupinou.org>
	<20040318195720.D89C43F04@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040318195720.D89C43F04@latitude.mynet.no-ip.org>
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
To: aeriksson@fastmail.fm
Cc: Dave Jones <davej@redhat.com>, Arjan van de Ven <arjanv@redhat.com>, cpufreq@www.linux.org.uk

On Thu, Mar 18, 2004 at 08:57:20PM +0100, aeriksson@fastmail.fm wrote:
> 
> 
> davej@redhat.com said:
> >> A few SpeedStep-capable systems don't perform according to
> >> specification: the CPUID and/or some MSRs don't tell us the 
> >> CPU is SpeedStep capable even though it definitely is.
> 
> > Is there nothing in the errata documents about this ? 
> 
> <snip>
> 
> > I'd merge this really as a last resort, and it's beginning to sound
> > like we don't really have any options (other than not support those
> > broken boxes). Ugh. 
> 
> 
> ...and ducrot@poupinou.org replied:
> > There is nothing in any data sheets for the check anyway, other than
> > it's not possible to distinguish a PIII (coppermine) with Speedstep
> > technology from one without Speedstep technology.  There is nothing
> > in any spec update I'm aware. 
> 
> 
> So, is the patch ok to merge?

To be more precise: if you look only datasheets and spec update,
there is no check given, but there is an application note, and there
is no errata for that AN.
I still don't understand why for example it hasn't been included
in any spec update?

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
