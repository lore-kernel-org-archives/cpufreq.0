From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Pentium IIIM not recognised
Date: Tue, 16 Sep 2003 12:26:30 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030916102630.GQ11391@poupinou.org>
References: <16230.17445.337511.852664@gargle.gargle.HOWL>
	<20030916091302.GO11391@poupinou.org>
	<16230.57673.292946.375545@gargle.gargle.HOWL>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <16230.57673.292946.375545@gargle.gargle.HOWL>
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

On Tue, Sep 16, 2003 at 12:09:13PM +0200, Ivan Kanis wrote:
> 
>     Ducrot> could you post lspci -v please?
> 
> Bien sur!
> 

Could you decomment that line, in arch/i386/kernel/speedstep-ich.c :

//#define SPEEDSTEP_DEBUG

Then try to replace:

               pci_read_config_byte(hostbridge, PCI_REVISION_ID, &rev);
               if (rev < 5) {
	       ^^^^^^^^^^^^
	    here, change to something like:
	       if (rev < 4) {


	       dprintk(KERN_INFO "cpufreq: hostbridge does not support speedstep\n");
                       speedstep_chipset_dev = NULL;
                       return 0;
               }


Unfortunately, if you have a dell i8k, speedstep-ich will not work.
If you don't have such a dell, perhaps it may work.

As an alternative, you can try cpufreq-smi from cvs.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
