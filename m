From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: SpeedStep New Driver for Pentium III (-M) using SMI interface
Date: Tue, 2 Sep 2003 10:18:05 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902081805.GO4401@poupinou.org>
References: <871xuzbycu.wl%miura@da-cha.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <871xuzbycu.wl%miura@da-cha.org>
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
To: Hiroshi Miura <miura@da-cha.org>
Cc: Ducrot Bruno <ducrot@arm.linux.org.uk>, cpufreq@www.linux.org.uk

On Tue, Sep 02, 2003 at 01:36:33PM +0900, Hiroshi Miura wrote:
> Hi,
> 
> I have tried to make the driver which use Intel Speedstep applet's 
> SMI interface for 3 months. 
> 
> This driver is based on the information from
> 
> 1. Microsoft Windows XP Document.
> 	we can get the SMI interface values from ax=E980/int15 BIOS call. 
> 
> 2. Intel SpeedStep Applet Document.(from HP.com)
> 	http://h18007.www1.hp.com/support/files/evonotebook/us/download/10631.html
> 	" Adds code to request transition ownership when processing 
> 	the system critical resume message. When a critical hibernate occurs, 
> 	the Applet does not receive any system level notification. The change forces
> 	 the Applet to re-acquire transition ownership upon resume from a critical hibernate. "
> 
> 	This is informative. This saied that  something 'ownership' call is needed on SMI 
> 	interface first.

Fine, point 2 actually killed me.  One little question though, the magic string need
all that?  Are you sure it can not be replaced by something else?  After all, you have
to download the applet from the OEM, not necessary from Intel.

I need probably to rewritte it a little though (some stuff in speedstep-lib.c
should be used), but anyway, that one will be commited soon, eventually
replacing speedstep-piix4 if all tests are ok.

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
