From: Ivor Hewitt <ivor@ivor.org>
Subject: Re: Kernel 2.6.7 speedstep-piix4 on vaio
Date: Mon, 2 Aug 2004 20:44:16 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408022044.16997.ivor@ivor.org>
References: <43210.141.228.156.225.1091110800.squirrel@141.228.156.225>
	<200407302020.50451.ivor@ivor.org>
	<20040802193141.GB17023@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040802193141.GB17023@redhat.com>
Content-Disposition: inline
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Monday 02 August 2004 19:31, Dave Jones wrote:

> hmm, I wonder if its worth adding DMI matches for certain laptops
> that need different arguments.
>
>  > Had to set BIOS settings as:-
>  > PnP OS: No
>  > CPU OS Control: Auto
>  > CPU Speed: Auto
>
> Though it wouldn't help with this, we'd just have to hope for the best.
>

I think that would be a good thing to do since it is such a common fix 
(changing the smi_cmd).... although I had tried the smi setting before 
juggling the bios settings which obviously would stop the fix working.... 
Although these were the default settings so it would work out of the box 
normally. I'd been tweaking them before to try and fix an annoying sound card 
problem! ho hum. Push one bubble down in the wallpaper and another one pops 
up. :-)

Regards,

-- 
Ivor Hewitt.
http://ivor.org - leylandii hedge -- http://ivor.it - technology
