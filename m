From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Strange frequency with p4-m and ich4
Date: Fri, 27 Feb 2004 14:43:42 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040227134342.GO2869@poupinou.org>
References: <20040226220349.D5BFD23947@ws5-3.us4.outblaze.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040226220349.D5BFD23947@ws5-3.us4.outblaze.com>
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
To: wel wel <wel@linuxmail.org>
Cc: cpufreq@www.linux.org.uk

On Thu, Feb 26, 2004 at 11:03:49PM +0100, wel wel wrote:
> Six months ago, i purchase a dell inspiron 8500, with a p4-m at 2,2 Ghz and a 845 chipset. I started with gentoo and 2.4.20-gs (with cpufreq patches), but frequency scaling didn't work as well. Next, with 2.6.0-testX, i got the same. Now i'm using 2.6.3-mm3 and i've the same error: at first boot, the os tooks only the processor's 50% (it works at 1,2 Ghz max, 650 in powersave mode). When i reboot, it gets full advantage, 2,2 Ghz with performance mode and 1,2 Ghz in powersave. What can i do to make it works well?. Six months is... so much time waiting, trying and searching for an answer :(.

Because it work.  It's just that the bios shipped with your laptop will
likely enable throttling.  You can get rid of that if you enable acpi
processor (well, hopefully. Sometimes brain damaged bios do not allow
throttling control via OS).

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
