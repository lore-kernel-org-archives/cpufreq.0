From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: speedstep capability checks
Date: Mon, 15 Mar 2004 16:37:32 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040315153732.GS28592@poupinou.org>
References: <20040314152016.0B04B3F04@latitude.mynet.no-ip.org>
	<20040315141517.GG8636@dominikbrodowski.de>
	<20040315142022.GA7069@devserv.devel.redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040315142022.GA7069@devserv.devel.redhat.com>
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
To: Arjan van de Ven <arjanv@redhat.com>
Cc: davej@redhat.com, aeriksson@fastmail.fm, cpufreq@www.linux.org.uk

On Mon, Mar 15, 2004 at 03:20:22PM +0100, Arjan van de Ven wrote:
> 
> On Mon, Mar 15, 2004 at 03:15:17PM +0100, Dominik Brodowski wrote:
> > I like this patch -- I've modified it a bit so that it applies to 2.6.4 and
> > also handles Arjan's strange 0x07 Tualatin. Please apply, Dave. 
> 
> Well I don't.
> It's copping out by not autodetecting cases that can reasonably be
> autodetected...

There were some speedstep capable processors (PIII 'early') that do not
pass the second check touched by this patch.

So far, the patch is ok for me.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
