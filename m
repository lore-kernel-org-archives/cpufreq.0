From: Lars Gemeinhardt <lars.gemeinhardt@searchbroker.de>
Subject: Re: Athlon Mobile support
Date: Wed, 02 Jul 2003 08:28:12 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3F027B7C.9090407@searchbroker.de>
References: <6.0.0.10.0.20030702080708.02b85db0@posta.spalletti.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <6.0.0.10.0.20030702080708.02b85db0@posta.spalletti.it>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk
Cc: Iacopo Spalletti <iacopo@spalletti.it>

Iacopo Spalletti wrote:

> I'm using 2.4.21 kernel, acpi-030619 patch and 030702 cvs snapshot of 
> cpufreq on a sony notebook (FX905P) with athlon xp 1600+ on board.
> I cannot find a way to enable powernow support for my cpu.
> Config vars are present for K6, speedstep and other processor but not 
> for athlon, supported in  older versions of cpufreq 

take this:

http://www.codemonkey.org.uk/cpufreq/cpufreq-2.4.22-1.gz

the cvs one for the 2.4.x kernel is the stable one (see 
http://www.brodo.de/cpufreq_old/kernel.html), which doesn't include the 
K7 (alias Athlon) :-(
The advanced one has support ... and Dave Jones is the new 
lead-developer ...

>
> Thanks in advance
>
>
> Best regards
>
> Iacopo Spalletti
> iacopo@spalletti.it

Ciao Lars

>
> PGP key block: http://www.spalletti.it/pgp 
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>
