From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: cpufreq and P-IIIM
Date: Tue, 19 Aug 2003 10:03:57 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030819080357.GI18032@poupinou.org>
References: <m2ptj5fiuc.fsf@tnuctip.rychter.com> <20030818112943.GD18032@poupinou.org> <m2r83ix4to.fsf@tnuctip.rychter.com>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <m2r83ix4to.fsf@tnuctip.rychter.com>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Rychter <jan@rychter.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Aug 18, 2003 at 10:18:11AM -0700, Jan Rychter wrote:
> >>>>> "Ducrot" == Ducrot Bruno <ducrot@poupinou.org>:
> [...]
>  Ducrot> Take a look at www.poupinou.org/cpufreq/
> 
> Files below, if anybody is interested.
> 
> Also, FWIW, cpufreq in 2.6.0-test3 doesn't support this chipset either.
> 

Could you please try:
modprobe speedstep-piix4 gpo_hilo=5

btw, have you tryed the latest patch?
ftp://ftp.poupinou.org/cpufreq/speedstep-piix4-260-test3.diff.bz2

I can not be sure if it work, since I have no hardware to test.

If that still refuse to work, please decomment
SPEEDSTEP_DEBUG both in speedstep-piix4.c and speedstep-lib.c

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
