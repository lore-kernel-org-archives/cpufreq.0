From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Pentium IIIM not recognised
Date: Wed, 17 Sep 2003 10:50:23 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030917085023.GY11391@poupinou.org>
References: <16230.17445.337511.852664@gargle.gargle.HOWL>
	<20030916091302.GO11391@poupinou.org>
	<16230.57673.292946.375545@gargle.gargle.HOWL>
	<20030916102630.GQ11391@poupinou.org>
	<16231.25993.582976.85275@gargle.gargle.HOWL>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <16231.25993.582976.85275@gargle.gargle.HOWL>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kanis <ivank@juliva.com>
Cc: cpufreq@www.linux.org.uk

On Tue, Sep 16, 2003 at 09:33:29PM +0200, Ivan Kanis wrote:
>     Ducrot> Unfortunately, if you have a dell i8k, speedstep-ich will
>     Ducrot> not work.  If you don't have such a dell, perhaps it may
>     Ducrot> work.
> 
> Alas it is a dell i8k :(
> 
>     Ducrot> As an alternative, you can try cpufreq-smi from cvs.
> 
> Would that one work? Could you tell me where the CVS server is
> located?
> 
> I would like to explain what I am trying to do. I don't want to hear
> the fan anymore. I don't mind if my systems runs 3 times slower I just
> want to focus on my work and the fan is annoying. Is there any other
> way than cpufreq to achieve this?
> 

For cpufreq cvs:
cvs -d:pserver:cvs@pubcvs.arm.linux.org.uk:/mnt/src/cvsroot co -rLINUX_2_4 cpufreq

then:
cd cpufreq
./patchin.sh /path/to/kernel

Please note that you need at least 2.4.22, not 2.4.21 (well, 2.4.21 should
be OK, but there are some rejects, just adding them by hand is easy, I
guess).

You may try also acpi for his idling stuff, which shall save more power
comsuption of the processor, and you may have ability to throtte the CPU.
AFAIR, there is no thermal zone in the i8k dsdt, but my memory may be
wrong, though.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
