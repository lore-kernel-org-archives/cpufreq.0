From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: SpeedStep New Driver for Pentium III (-M) using SMI interface
Date: Wed, 3 Sep 2003 09:33:21 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030903073321.GY4401@poupinou.org>
References: <871xuzbycu.wl%miura@da-cha.org> <20030902083150.GA3958@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030902083150.GA3958@brodo.de>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: Hiroshi Miura <miura@da-cha.org>, Ducrot Bruno <ducrot@arm.linux.org.uk>, cpufreq@www.linux.org.uk

On Tue, Sep 02, 2003 at 10:31:50AM +0200, Dominik Brodowski wrote:
> Thanks for this very interesting work. Unfortunately, it doesn't work on my
> aged notebook, but well, the GPO driver didn't work either....
> 
> less-verbose-and-export
> 	to run as a module, we need to export ist_info. Also, only show the
> 	IST_INFO line in dmesg if speedstep_smi is enabled.

Showing the IST_INFO line should be done in the driver, not in arch/i386/kernel/setup.c


-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
