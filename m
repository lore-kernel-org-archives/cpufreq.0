From: olgaAr <olgaAr@fuckup.homelinux.com>
Subject: Re: Help! Cpufreq makes my laptop crash!
Date: Thu, 15 Jul 2004 16:22:59 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40F69343.6000908@fuckup.homelinux.com>
References: <40F549D5.8030100@fuckup.homelinux.com>
	<20040714115717.4gsocksks0s8o4wc@carlthompson.net>
	<40F58B6C.60606@fuckup.homelinux.com>
	<20040714140944.g0k8c40swcskss8g@carlthompson.net>
	<20040715095710.GN6326@poupinou.org>
	<40F68E0D.8000307@fuckup.homelinux.com>
	<20040715140507.GP6326@poupinou.org>
	<20040715141904.GQ6326@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040715141904.GQ6326@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Bruno Ducrot wrote:

>Compile it as a module in fact, then 'modprobe processor' after your
>testings (or after 30 minutes).
>A mobile AMD athlon XP without the ACPI idle loop could potentially
>overheat fast...
>
>Cheers,
>
>  
>
Well, I had it compiled as module before. I already tried unloading 
powernow_k7, thermal and processor. When reloading powernow_k7, the 
"processor" module was reloaded as well?!

Cheers,
Oliver
