From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] Fix cpu recognization if BIOS does not set cpu to max
	freq [was: Re: [Bug 3600] New: Cpu recognization fails after
	upgrade from 2.6.7 to 2.6.9]
Date: Wed, 10 Nov 2004 21:15:02 +0100
Message-ID: <20041110201502.GC31422@poupinou.org>
References: <200410201413.i9KED718023481@fire-1.osdl.org>
	<20041020154744.GA5372@dreamland.darkstar.lan>
	<20041020180537.17d0dd7c@paraclito.crema>
	<20041020165110.GA6992@dreamland.darkstar.lan>
	<20041021102529.GD22405@poupinou.org>
	<20041023214325.GA13050@dreamland.darkstar.lan>
	<20041029153544.GA9799@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041029153544.GA9799@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

> - there's an entry "fsbspeed" in pst_s. Is this useful to determining the
>   FSB, and then checking whether FSB*CFID makes more sense than FSB*MFID
>   when comparing it to cpu_khz?

There is no such information if you have to configure with acpi...
Further, fsbspeed is used in order to check if PST is valid by
comparing with the actual FSB.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
