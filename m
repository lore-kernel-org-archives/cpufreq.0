From: Viktor Radnai <efti@gotiao.com>
Subject: Re: Pentium 4m kernel 2.4.21
Date: Sat, 23 Aug 2003 19:49:12 +1000
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3F473898.4020101@gotiao.com>
References: <000001c3694b$6b4eb5d0$0200a8c0@informatik.domaene>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <000001c3694b$6b4eb5d0$0200a8c0@informatik.domaene>
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
To: "Martin Klinkigt (multimedia-test)" <m.klinkigt@multimedia-test.de>
Cc: cpufreq@www.linux.org.uk

Hi Martin,

I've managed to clock down my 2GHz Pentium 4m to around 150MHz by doing 
the following:

- compile both speedstep and p4-clockmod as modules
- modprobe speedstep
- set the governor to powersave
- rmmod speedstep
- modprobe p4-clockmod
- set the CPU speed

Hope this helps,

Vik

Martin Klinkigt (multimedia-test) wrote:
> Hello,
> I has a Pentium 4 m and the 2.4.21 Kernel with cpufreq-2.4.21-2. 
> Now I can change the frequency in each case between 1,2 and 1,6 Ghz.
> Under Windows I had it however already on 400 MHz.
> 
> Can I change it somehow that he is further as 1.2 Ghz down?  
> 
> Thanks
> Martin
> 
> 
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
> 
> 
