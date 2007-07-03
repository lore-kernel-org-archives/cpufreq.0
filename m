From: Nebojsa Trpkovic <trxman@gmail.com>
Subject: Re: Overclocking a Conroe and Using Speedstep/cpufreq.
Date: Tue, 03 Jul 2007 22:01:06 +0200
Message-ID: <468AAB02.8000509@gmail.com>
References: <414673.66985.qm@web61217.mail.yahoo.com>
	<20070614183251.GD1223@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:references:in-reply-to:x-enigmail-version:content-type:content-transfer-encoding;
	b=mp5/7WPOlAA8oIyaZc7MrRlHsvh38reoCNfKBH6R8mhCNGQhlBFGJ71EaYRg0fGP8PH0luZBiFJ7NHiWHMqGpnAyNkTMWFabHt4oePKwMsNQQCe6TOtlJW4RgbhegVZpTcSkBSSD7K1Xj9Ih5MEJWC20oHpeBgl2v55SiKHn3/Q=
In-Reply-To: <20070614183251.GD1223@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

so, BIOS have table with Frequency/Voltage pairs and NOT
Multiplier/Voltage pairs ?



Dave Jones wrote:
> On Thu, Jun 14, 2007 at 10:26:01AM -0700, byteFrame wrote:
>  > 
>  > Word up.
>  > 
>  > When I dont overclock my cpu (2.4 ghz) cpufreq works
>  > fine (with the ondemand governor) but when I overclock
>  > the cpu to 3.0 ghz in the bios, cpu freq doesnt work.
>  > They neccessary sys files arent in
>  > /sys/devices/system/cpu0/ etc etc. I had orginally
>  > been using the acpi cpu freq driver, but the "Enhanced
>  > Speedstep" inst working either (gonna try it without
>  > an option, but I doubt itll work)
> 
> Your BIOS only knows about speeds the chip is rated for.
> 
> 	Dave
> 
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGiqsCqDH2e5UXzrQRAmvEAJ4hx/5GNPF79RNZJRlPmd7tfUIj0wCfbhL0
qOOSP9mcNDI4aJxhOETOgOY=
=t3AW
-----END PGP SIGNATURE-----
