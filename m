From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [Bug 61071] New: powernow-k8 is not autoloaded
Date: Mon, 09 Sep 2013 23:11:17 +0200
Message-ID: <1712564.WS6sGrXry7@vostro.rjw.lan>
References: <bug-61071-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-61071-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bugzilla-daemon@bugzilla.kernel.org
Cc: cpufreq@vger.kernel.org

On Monday, September 09, 2013 02:58:13 PM bugzilla-daemon@bugzilla.kernel.org wrote:
>
> I'm running Arch Linux on a AMD Athlon 64 X2 Dual Core Processor 5000+. On
> Kernel 3.10, powernow-k8 gets loaded automatically (as expected since 3.4).
> With 3.11, it doesn't get loaded automatically, so cpupower fails at bootup.
> But it loads fine if I load it via /etc/modules-load.d/.
> 
> Some information:
> 
> modinfo powernow-k8:
> alias:          x86cpu:vendor:0002:family:000F:model:*:feature:*
> 
> udevadmin info --export-db | grep cpu:
> DEVPATH=/devices/system/cpu/cpu0
> MODALIAS=x86cpu:vendor:0002:family:000F:model:006B:feature:,0000,0001,0002,0003,0004,0005,0006,0007,0008,0009,000B,000C,000D,000E,000F,0010,0011,0013,0017,0018,0019,001A,001C,0020,0021,0022,0023,0024,0025,0026,0027,0028,0029,002B,002C,002D,002E,002F,0030,0031,0034,0036,0037,0038,0039,003B,003D,003E,003F,0064,006A,006E,0070,0071,0074,0075,007A,0080,008D,00C0,00C1,00C2,00C3,00C4,00C8,0106
> 
> Vendor and family still match, so I have no idea why the module doesn't get
> loaded.

That is a udev problem as described in this commit message:

http://cgit.freedesktop.org/systemd/systemd/commit?id=bf7f800f2b3e93ccd1229d4717166f3a4d3af72f

Please ask your distro to push that udev fix in an update.
