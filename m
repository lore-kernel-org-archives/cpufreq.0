From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k7 for XP-M 2400+ CPU
Date: Wed, 26 May 2004 12:20:57 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040526102057.GK4933@poupinou.org>
References: <20040525225007.2DCE949C52@nathan.muc.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040525225007.2DCE949C52@nathan.muc.de>
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
To: Harald Milz <milz@seneca.muc.de>
Cc: cpufreq@www.linux.org.uk

On Wed, May 26, 2004 at 12:50:07AM +0200, Harald Milz wrote:
> Hi,
> 
> could any kind soul please send me the powernow-k7 output for his Athlon
> XP-M 2400+ CPU (cpuid 0x7A0)?
> 
> Background: my Asus A7V8X BIOS does not support Athlon mobile CPUs (and
> probably never will). But it is fairly easy to modify powernow-k7 in a
> way to set the PST data on the module command line, fill a fake struct
> pst accordingly and get a working setup. This could be a workaround for
> all the people who run mobile CPUs on desktop boards or broken notebook
> BIOSes and would like to save some power. OK we will not be able to set
> the voltage but setting the clock rate would help anyway. Collecting PST
> data for various cpuids would help here BTW. 
> 
> Remark: my Asus board w/ BIOS 1014 (latest) recognizes the CPU as an Athlon
> MP 1800. Duh. So the powernow and acpi modules do not get any chance to do
> anything because they don't get advertised a mobile CPU.
> 

a dmesg please for the powernow-k7 stuff?  Not all athlon are powernow
capable at first.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
