From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Acer Aspire  1350 broken PST
Date: Fri, 16 Apr 2004 14:05:19 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040416120519.GT8953@poupinou.org>
References: <c5n0ms$7nc$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <c5n0ms$7nc$1@sea.gmane.org>
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
To: jy <jy454@yahoo.fr>
Cc: cpufreq@www.linux.org.uk

On Fri, Apr 16, 2004 at 12:00:58AM +0200, jy wrote:
> I have Acer Aspire 1357LMi laptop with AMD Athlon XP 3000+ and of course 
> cpufreq don't work
> 

Could you please try latest cpufreq?  it's at
http://www.codemonkey.org.uk/projects/bitkeeper/cpufreq/

with CONFIG_ACPI_PROCESSOR=YES ?

I would like also that you test dump_psb.c

wget http://poup.poupinou.org/cpufreq/powernow-k7/dump_psb.c
gcc -O2 -Wall dump_psb.c -o dump_psb
sudo ./dump_psb 9

in order to check if that model actually do have more PSTs.

Cheers,


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
