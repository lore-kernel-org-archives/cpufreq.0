From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH] [RFC] [0/2] powernow-k7.  Recalibrate cpu_khz
Date: Thu, 18 Nov 2004 17:10:34 +0100
Message-ID: <20041118161034.GA31422@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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

Hi,

Here come two patches in order to fix some issues with powernow-k7.

The main trouble is that we can't rely on cpu_khz when that one is
computed at boot time.  AMD will require that the CPU will be at max
frequencies, but some BIOS do not respect this.  More, the BIOS is only
required to change the frequency of the processor, but only at POST
time.  Some BIOS also do not follow this rule, so that even if the
processor is at full speed at POST, it may decide (probably after
switching to ACPI or APM mode?) to switch to another frequency.

The only workaround for this two kind of bugs I see is to recalibrate
cpu_khz, but this require discussions with other people, I guess.  The
second patch will be the powernow-k7 portion.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
