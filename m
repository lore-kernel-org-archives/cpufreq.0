From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Coppermine, cpufreq
Date: Sun, 2 Nov 2003 14:29:57 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031102132957.GJ21970@poupinou.org>
References: <3FA11700.8080908@tcpa-info.org>
	<20031030140910.GH28351@poupinou.org>
	<3FA17DDF.5000600@tcpa-info.org>
	<20031031071457.GL28351@poupinou.org>
	<3FA25853.3030100@tcpa-info.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3FA25853.3030100@tcpa-info.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Hannich <dumb@tcpa-info.org>
Cc: cpufreq@www.linux.org.uk

On Fri, Oct 31, 2003 at 01:40:51PM +0100, Matthias Hannich wrote:
> Am 10/31/2003 08:14 AM schrieb Ducrot Bruno:
> >>>PS: If modprobe speedstep-ich still  do not work
> >>>modpbore speedstep-lib
> >>
> >>No error messages.
> >>
> >>
> >>>modprobe speedstep-ich
> >>
> >
> >Are you sure you have an ich based system?
> 
> 00:00.0 Host bridge: Silicon Integrated Systems [SiS] 630 Host (rev 31)
> 00:01.0 ISA bridge: Silicon Integrated Systems [SiS] 85C503/5513
> 

Due to lack of documentation, and since no body (AFAIC) has even started
to reverse engeener, the SiS is not supported.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
