From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Help with Installation
Date: Sat, 3 Apr 2004 16:50:45 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040403145045.GV19001@poupinou.org>
References: <200404031342.34522.ozeki@simnet.is>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200404031342.34522.ozeki@simnet.is>
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
To: ozeki@simnet.is
Cc: cpufreq@www.linux.org.uk

On Sat, Apr 03, 2004 at 01:42:34PM +0000, Ozeki San wrote:
> Hi all,
> 
> I'm trying to get trough my first installation of cpufreq and I was wondering 
> if someone could point me to some more documentation on how to install it.  I 
> got the cpufreq-LINUX_2_4-20040402.tar.gz tarball for the 2.4.25 kernel.
> 
> I'm trying this out on my IBM ThinkPad T41 which I suppose would be using the 
> speedstep-centrino driver.  The question is : how is the cpufreq package 
> included in the configuring and compile of the kernel ?
> 
> I've been trying to find some sort of an INSTALL file without luck, does 
> anyone have or know of such a description ?

tar xzvfp cpufreq-...tar.gz
cd cpufreq
./patchin.sh /path/to/kernel/sources

Do *not* remove the cpufreq directory that was unpacked.
then

cd /path/to/kernel/sources
make menuconfig (or your preferred *config).


Under 'Processor type and feature' you will have a new
'CPU Frequency scaling' menu.

Under it:

'CPU Frequency scaling' -> yes
'CPU frequency table helpers' -> yes

Perhaps 'Support for governing from userspace' -> yes
(or else most daemon may not work),

Then probably 
'Intel Pentium-M Enhanced SpeedStep' -> yes or module, as you like.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
