From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: speedstep_smi & psmouse problems?
Date: Tue, 25 May 2004 20:00:07 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040525180007.GH4933@poupinou.org>
References: <aeriksson2@fastmail.fm>
	<20040520194800.4DE6A4137@latitude.mynet.no-ip.org>
	<20040524102240.EF92C3F04@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040524102240.EF92C3F04@latitude.mynet.no-ip.org>
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
To: aeriksson2@fastmail.fm
Cc: cpufreq@www.linux.org.uk

Hi,

On Mon, May 24, 2004 at 12:22:39PM +0200, aeriksson2@fastmail.fm wrote:
> Tried that (using proto=exps instead of proto=imps), but no success.
> Do you know if the psmouse driver can be tweaked to handle this (hw
> bug, I assume) more gracefully? Given the way the mouse jumps on
> the screen, It seems a low-pass filter could do some good...

I think it's a bug in the firmware of the embedded controller.  What
about a bios upgrade + EC firmware upgrade?

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
