From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [new] event mode on speedstep-smi.
Date: Thu, 4 Sep 2003 17:30:13 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030904153013.GJ4401@poupinou.org>
References: <87ekywzjvm.wl%miura@da-cha.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <87ekywzjvm.wl%miura@da-cha.org>
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
To: Hiroshi Miura <miura@da-cha.org>
Cc: Ducrot Bruno <ducrot@arm.linux.org.uk>, cpufreq@www.linux.org.uk

> perf_level:  high 16bit is 0x07d0. this is 2000 in decimal.
> I think this means polling interval is 2000ms.
> 
> This code is based on my original one.
> Ducrot, How about this?
> 

I don't understand the real use for.  Does this permit
to switch from performance to powersave when plug in/out ac?
If yes, you can have the exact same behaviour via acpi and acpid,
with an interrupt driven approach instaead of just polling.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
