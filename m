From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8 won't load on Athlon64
Date: Tue, 24 Aug 2004 17:36:09 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040824153609.GL29560@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A8439912EB@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A8439912EB@SAUSEXMB1.amd.com>
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
To: paul.devriendt@amd.com
Cc: ajp@aripollak.com, cpufreq@www.linux.org.uk

Hi Paul,
On Mon, Aug 23, 2004 at 11:55:41AM -0500, paul.devriendt@amd.com wrote:
> >From previous such problems I have looked at, the BIOS writers left
> the old K7 tables in the BIOS when they implemented the K8 support.
> That may or may not be the case here. I suggest the best way forward
> is to ignore this (or report it to the machine vendor as a broken
> BIOS) and get the ACPI stuff working.
> 

At least for the ACPI stuff, sound like there is a kind of mix of the
two..  Some fields specific to the k8 seems to be filled though
they should be zeroed for k7 (I've not throughfully verified, but the
fact that vid are somehow constants remind me cool'n quiet for the
athlon-xp).  I guess someone from AMD should warn them (hint hint ;)

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
