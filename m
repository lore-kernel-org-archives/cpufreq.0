From: Harald Milz <milz@seneca.muc.de>
Subject: Re: help using Harold Milz patch for PSB overide
Date: Tue, 24 Aug 2004 09:25:33 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040824072533.4B4F350172@nathan.muc.de>
References: <20040823222846.18763.qmail@web86904.mail.ukl.yahoo.com>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

mark newman <emergant2000@yahoo.co.uk> wrote:
> using insmod.  I am however wonderring if all the
> relevant dependencies were loaded.  I'll check on
> this.

I added this line to my modprobe.conf.local, and simply modprobe
everything: 

options powernow-k7 mycpuid=0x7a0 myfsbspeed=133 mymaxfid=0x15 mystartvid=0xb mynumpstates=2 myfids=0x15,0x0d

Don't forget to run "depmod -a" after modifying modprobe.conf.*. 

-- 
Diplomacy is the art of saying "nice doggy" until you can find a rock.
