From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [new] event mode on speedstep-smi.
Date: Fri, 5 Sep 2003 01:25:55 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030904232555.GA8650@brodo.de>
References: <87ekywzjvm.wl%miura@da-cha.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <87ekywzjvm.wl%miura@da-cha.org>
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
To: Hiroshi Miura <miura@da-cha.org>
Cc: Ducrot Bruno <ducrot@arm.linux.org.uk>, cpufreq@www.linux.org.uk

On Thu, Sep 04, 2003 at 11:52:13PM +0900, Hiroshi Miura wrote:
> Hi,
> 
> from some BIOS document
> 	http://support.twinhead.com/CSD/CDROM/driver/p98TF/Bios/P98TF07.doc 
>    google cache
> 	http://www.google.co.jp/search?q=cache:_RdlAmnkI4wJ:support.twinhead.com/CSD/CDROM/driver/p98TF/Bios/P98TF07.doc
> 
> 	"The modem wouldn't connect most of the time and if it did connect , 
> 	whenever a power status event happened with the speedstep applet, 
> 	it would cause the modem to disconnect with the IST applet loaded."
> 
> I find from this that IST SMI has some 'power status event' call.
> 
> 	"Intel says that we need to implement an Event Port option in the 
> 	BIOS to cut down on the amount of SMI events. Resolution
> 	1.Upgrade the Registry, The IST polling mode will change from SMI mode 
> 	to Event Port mode."
> 
> This said we can use "Event Port mode" other than "SMI power status event".
> 
> we are already has data about Event Port mode,  that is 
> 
> from dmesgs,
> Panasonic Let's Note.
>   IST_SMI: signature:0x47534943 command:0x008200b2 event:0x000f104a perf_level:0x07d00000
> SONY VAIO PCG-Z505VR/K
>   IST_SMI: signature:0x47534943 command:0x008000b2 event:0x000000b3 perf_level:0x07d00100
> IBM ThinkPad T21 TYPE 2647-G2J
>   IST_SMI: signature:0x47534943 command:0x008200b2 event:0x00c000b3 perf_level:0x07d00000
> 
> I found that  "event"  low 16bit is io-port (in).
> 
> perf_level:  high 16bit is 0x07d0. this is 2000 in decimal.
> I think this means polling interval is 2000ms.
> 
> This code is based on my original one.
> Ducrot, How about this?

Actually, I much preferred the original version of your driver. This "event"
stuff can either be done as a seperate governor (different file), or in
userspace (as Bruno has pointed out).

What do you think about the patches for your driver I sent you?

	Dominik
